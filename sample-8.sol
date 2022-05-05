contract sample8 {
    int public c = 23;
    int internal b = 43;

    function sample8() {
        this.a();

        a();

        b = 21;

        this.b;

        this.b();

        this.b(8);
    }

    function a() external {

    }
}
