{ lib, myLib, pkgs, config, ... }:

let cfg = config.my.services;
in {
  options.my.services.postgresql = myLib.mkServiceOption {
    name = "postgresql";
    extraConfig.enableAdmin = lib.mkEnableOption "Enable pgAdmin";
  };

  config.services.pgadmin = lib.mkIf cfg.postgresql.enableAdmin {
    enable = true;
    initialEmail = config.my.system.users.${config.my.system.admin}.email;
    initialPasswordFile = (builtins.toFile "pg-password" "root");
    minimumPasswordLength = 4;
  };

  config.services.postgresql = lib.mkIf cfg.postgresql.enable {
    enable = true;
    checkConfig = true;
    enableTCPIP = false;
    package = pkgs.postgresql_15;

    extensions = [ ];
    ensureDatabases = [ "public" ];
    ensureUsers = [{
      name = config.my.system.admin;
      ensureClauses = {
        login = true;
        superuser = true;
        createrole = true;
        createdb = true;
        replication = true;
      };
    }];

    # http://pgconfigurator.cybertec.at/;
    # https://git.darmstadt.ccc.de/maralorn/nixos-config/-/blob/master/nixos/roles/matrix-synapse/postgres-tuning.nix
    settings = {
      # Connectivity;
      max_connections = 100;
      superuser_reserved_connections = 3;

      # Memory Settings;
      shared_buffers = "1024 MB";
      work_mem = "32 MB";
      maintenance_work_mem = "320 MB";
      huge_pages = "off";
      effective_cache_size = "3 GB";
      # concurrent IO only really activated if OS supports posix_fadvise function;
      effective_io_concurrency = 100;
      # speed of random disk access relative to sequential access (1.0)
      random_page_cost = 1.25;

      # Monitoring;
      # per statement resource usage stats
      shared_preload_libraries = "pg_stat_statements";
      track_io_timing = "on"; # measure exact block IO times;
      # track execution times of pl-language procedures if any;
      track_functions = "pl";

      # Replication;
      wal_level = "replica"; # consider using at least "replica";
      max_wal_senders = 0;
      synchronous_commit = "on";

      # Checkpointing: ;
      checkpoint_timeout = "15 min";
      checkpoint_completion_target = 0.9;
      max_wal_size = "1024 MB";
      min_wal_size = "512 MB";

      # WAL writing;
      wal_compression = "on";
      wal_buffers = -1; # auto-tuned by Postgres till maximum of segment size
      wal_writer_delay = "200ms";
      wal_writer_flush_after = "1MB";

      # Background writer;
      bgwriter_delay = "200ms";
      bgwriter_lru_maxpages = 100;
      bgwriter_lru_multiplier = 2.0;
      bgwriter_flush_after = 0;

      # Parallel queries: ;
      max_worker_processes = 3;
      max_parallel_workers_per_gather = 2;
      max_parallel_maintenance_workers = 2;
      max_parallel_workers = 3;
      parallel_leader_participation = "on";

      # Advanced features ;
      enable_partitionwise_join = "on";
      enable_partitionwise_aggregate = "on";
      jit = "on";

      jit_above_cost = 100000;
      jit_inline_above_cost = 150000;
      jit_optimize_above_cost = 500000;

      # log slow queries
      log_min_duration_statement = 100;
      "auto_explain.log_min_duration" = 100;

      # logging configuration
      log_connections = true;
      log_statement = "all";
      logging_collector = true;
      log_disconnections = true;
      log_destination = lib.mkForce "syslog";
    };
  };
}
