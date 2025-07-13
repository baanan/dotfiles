{ pkgs, ... }:

{
  home.packages = [ pkgs.gnomeExtensions.blur-my-shell pkgs.gnomeExtensions.dash-to-panel ];
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent=''{"RIPPLE": 4, "PLANK": 4, "SIMPLE": 1}'';
      appicon-margin=4;
      appicon-padding=4;
      appicon-style="NORMAL";
      available-monitors=[0];
      dot-color-dominant=false;
      dot-color-override=false;
      dot-color-unfocused-different=false;
      dot-position="TOP";
      dot-style-focused="DOTS";
      dot-style-unfocused="DOTS";
      focus-highlight-opacity=25;
      group-apps=false;
      group-apps-label-max-width=0;
      group-apps-underline-unfocused=true;
      group-apps-use-fixed-width=true;
      group-apps-use-launchers=false;
      hotkeys-overlay-combo="TEMPORARILY";
      intellihide=false;
      leftbox-padding=-1;
      panel-anchors=''{"0":"MIDDLE"}'';
      panel-element-positions=''{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true, "position":"centered"},{"element":"leftBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stacke dTL"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'';
      panel-lengths=''{"0":100}'';
      panel-positions=''{"0":"TOP"}'';
      panel-sizes=''{"0":32}'';
      primary-monitor=0;
      status-icon-padding=-1;
      stockgs-keep-top-panel=false;
      trans-panel-opacity=0.0;
      trans-use-custom-opacity=true;
      tray-padding=-1;
      window-preview-title-position="TOP";
    };
  };
}
