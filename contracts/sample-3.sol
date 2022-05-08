contract Sample3 {
    struct myStruct {
        bool myBool;
        string myString;
    }

    myStruct s1;
    myStruct s2 = myStruct(true, "Str1");

    function sample(bool initBool, string initStr) {
        s1 = myStruct(initBool, initStr);

        myStruct memory s3 = myStruct(initBool, initStr);
    }
}
