contract sample7L1 {
    int a;

    function sample7L1(int b) payable {
        a = b;
    }

    function assign(int c) {
        a = c;
    }

    function makePayment(int d) payable {
        a = d;
    }
}

contract sample7L2 {
    function hello() {

    }

    function sample7L2(address addressOfContract) {
        sample7L1 s = (new sample7L1).value(12)(23);

        s.makePayment(22);

        s.makePayment.value(45)(12);

        s.makePayment.gas(895)(12);

        s.makePayment.value(4).gas(900)(12);

        this.hello();

        sample7L1 s2 = sample7L1(addressOfContract);

        s2.makePayment(12);
    }
}
