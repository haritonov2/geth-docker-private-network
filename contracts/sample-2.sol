contract Sample2 {
    string myString = "";
    bytes myRawString;

    function sample(string initString, bytes rawStringInit) {
        myString = initString;

        string myString2 = myString;

        string memory myString3 = "ABCD";

        myString3 = "TREW";

        myRawString = rawStringInit;

        myRawString.length++;

        string myString4 = "Example";


    }
}
