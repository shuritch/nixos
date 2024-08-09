{
  powerManagement.cpuFreqGovernor = "ondemand";
  powerManagement.powertop.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = "70";
      STOP_CHARGE_THRESH_BAT0 = "90";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";
      CPU_HWP_DYN_BOOST_ON_AC = "1";
      CPU_HWP_DYN_BOOST_ON_BAT = "0";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CIE_ASPM_ON_AC = "performance";
      CIE_ASPM_ON_BAT = "powersupersave";
      INTEL_GPU_MIN_FREQ_ON_AC = "300";
      INTEL_GPU_MIN_FREQ_ON_BAT = "300";
      INTEL_GPU_MAX_FREQ_ON_AC = "1150";
      INTEL_GPU_MAX_FREQ_ON_BAT = "300";
      INTEL_GPU_BOOST_FREQ_ON_AC = "1150";
      INTEL_GPU_BOOST_FREQ_ON_BAT = "300";
      ENERGY_PERF_POLICY_ON_BAT = "powersave";
    };
  };
}
