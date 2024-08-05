//? Blur for command palette
document.addEventListener('DOMContentLoaded', () => {
  const checkElement = setInterval(() => {
    const commandDialog = document.querySelector('.quick-input-widget');
    if (!commandDialog) return void console.log('Command dialog 404');
    const { style } = commandDialog;
    const observer = new MutationObserver(mutations => {
      for (var { type, attributeName } of mutations) {
        if (type !== 'attributes' || attributeName !== 'style') return;
        style.display === 'none' ? removeBlur() : addBlur();
      }
    });

    observer.observe(commandDialog, { attributes: true });
    clearInterval(checkElement);
  }, 500);

  const DELTA = 500;
  let timestamp = 0;
  document.addEventListener('keydown', event => {
    const { altKey, key, ctrlKey, shiftKey } = event;
    const now = new Date();
    const isAlt = altKey || key === 'alt';
    const altAlt = isAlt && now - timestamp < DELTA;
    const ctrlShiftP = shiftKey && ctrlKey && key === 'p';
    const ctrlP = ctrlKey && key === 'p';
    const esc = key === 'Escape' || key === 'Esc';
    const f1 = key === 'f1';
    if (isAlt) timestamp = altAlt ? 0 : now;
    if (!altAlt && !ctrlShiftP && !ctrlP && !esc && !f1) return;
    event.preventDefault();
    esc ? removeBlur() : addBlur();
  });

  // prettier-ignore
  document.addEventListener('keydown', ({ key }) => {
    if (key !== 'Escape' && key !== 'Esc') return;
    removeBlur();
  }, true);
});

function addBlur() {
  if (document.getElementById('command-bl1ur')) return;
  const container = document.querySelector('.monaco-workbench');
  const blur = document.createElement('div');
  blur.setAttribute('id', 'command-blur');
  blur.addEventListener('click', () => void blur.remove());
  container.appendChild(newElement);
}

function removeBlur() {
  const blur = document.getElementById('command-blur');
  if (blur) blur.remove();
}
