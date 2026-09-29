{ den, ... }:
{
  # personal desktop
  den.aspects.personal = {
    includes = [ den.aspects.minimal ];

    nixos = {
      # Define hostname.
      networking.hostName = "nixos";

      # Enable networking.
      networking.networkmanager.enable = true;

      # Set time zone.
      time.timeZone = "America/New_York";
      time.hardwareClockInLocalTime = true;

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
      };
    };
  };
}
