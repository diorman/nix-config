{ ... }:

{

  ###############################################################################
  # General UI/UX                                                               #
  ###############################################################################

  system.defaults.NSGlobalDomain = {
    # Enable dark mode
    AppleInterfaceStyle = "Dark";

    # Always show scrollbars
    AppleShowScrollBars = "Always";

    # Disable automatic capitalization as it’s annoying when typing code
    NSAutomaticCapitalizationEnabled = false;

    # Disable smart dashes as they’re annoying when typing code
    NSAutomaticDashSubstitutionEnabled = false;

    # Disable automatic period substitution as it’s annoying when typing code
    NSAutomaticPeriodSubstitutionEnabled = false;

    # Disable smart quotes as they’re annoying when typing code
    NSAutomaticQuoteSubstitutionEnabled = false;

    # Disable auto-correct
    NSAutomaticSpellingCorrectionEnabled = false;

    # Disable animation when opening and closing of windows and popovers
    NSAutomaticWindowAnimationsEnabled = false;

    # Disable automatic termination of inactive apps
    NSDisableAutomaticTermination = true;

    # Save to disk (not to iCloud) by default
    NSDocumentSaveNewDocumentsToCloud = false;

    # Disable the over-the-top focus ring animation
    NSUseAnimatedFocusRing = false;

  };

  # Adjust toolbar title rollover delay
  system.defaults.CustomUserPreferences.system.defauts.NSGlobalDomain.NSToolbarTitleViewRolloverDelay =
    0;

  # Disable the “Are you sure you want to open this application?” dialog
  system.defaults.LaunchServices.LSQuarantine = false;

  ###############################################################################
  # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
  ###############################################################################

  # Trackpad: enable tap to click
  system.defaults.trackpad.Clicking = true;

  # allow left and right-clicking
  system.defaults.magicmouse.MouseButtonMode = "TwoButton";

  system.defaults.NSGlobalDomain = {
    # Disable press-and-hold for keys in favor of key repeat
    ApplePressAndHoldEnabled = false;

    # Set fast keyboard repeat rate
    InitialKeyRepeat = 20;
    KeyRepeat = 2;
  };

  # Set language and text formats
  system.defaults.CustomUserPreferences.system.defauts.NSGlobalDomain.AppleLanguages = [
    "en"
    "es"
  ];
  system.defaults.NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
  system.defaults.NSGlobalDomain.AppleMetricUnits = 1;

  ###############################################################################
  # Screen                                                                      #
  ###############################################################################

  # Require password immediately after sleep or screen saver begins
  system.defaults.screensaver = {
    askForPassword = true;
    askForPasswordDelay = 0;
  };

  ###############################################################################
  # Finder                                                                      #
  ###############################################################################

  # Finder: show all filename extensions
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;

  system.defaults.finder = {
    # Finder: show hidden files by default
    AppleShowAllFiles = true;

    # Finder: show path bar
    ShowPathbar = true;

    # Display full POSIX path as Finder window title
    _FXShowPosixPathInTitle = true;

    # Disable the warning when changing a file extension
    FXEnableExtensionChangeWarning = true;

    # Use list view in all Finder windows by default
    FXPreferredViewStyle = "Nlsv";
  };

  system.defaults.CustomUserPreferences = {
    "system.defaults.finder" = {
      # Keep folders on top when sorting by name
      _FXSortFoldersFirst = true;
    };

    # Avoid creating .DS_Store files on network or USB volumes
    "com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };

  };

  ###############################################################################
  # Dock                                                                        #
  ###############################################################################

  system.defaults.dock = {
    # Automatically hide and show the Dock
    autohide = true;

    # Set the icon size of Dock items to 36 pixels
    tilesize = 36;

    # Change minimize/maximize window effect
    mineffect = "scale";

    # Minimize windows into their application’s icon
    minimize-to-application = true;

    # Wipe all (default) app icons from the Dock
    # This is only really useful when setting up a new Mac, or if you don’t use
    # the Dock to launch apps.
    persistent-apps = [ ];

    # Show only open applications in the Dock
    static-only = true;

    # Don’t animate opening applications from the Dock
    launchanim = false;

    # Remove the auto-hiding Dock delay
    autohide-delay = 0.0;

    # Remove the animation when hiding/showing the Dock
    autohide-time-modifier = 0.0;

    # Make Dock icons of hidden applications translucent
    showhidden = true;

    # Don’t show recent applications in Dock
    show-recents = false;
  };

  ###############################################################################
  # Mac App Store                                                              #
  ###############################################################################

  # Enable the automatic update check
  system.defaults.CustomUserPreferences = {
    "com.apple.SoftwareUpdate" = {
      AutomaticCheckEnabled = true;

      # Check for software updates daily, not just once per week
      ScheduleFrequency = 1;
      # Download newly available updates in background
      AutomaticDownload = 1;

      # Install System data files & security updates
      CriticalUpdateInstall = 1;
    };
  };

  # Apply changes without the logout/login cycle
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}
