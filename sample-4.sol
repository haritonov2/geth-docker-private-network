contract Sample4 {
    enum OS { Windows, OSX, UNIX, Linux }

    OS choice;

    function sample(OS chosen) {
        choice = chosen;
    }

    function setLinuxOS() {
        choice = OS.Linux;
    }

    function getChoice() {
        return choice;
    }
}
