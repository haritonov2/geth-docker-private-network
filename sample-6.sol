contract Sample6 {
    struct Struct {
        mapping (int => int) myMap;
        int myNumber;
    }

    int[] myArr;
    Struct myStruct;

    function sample(int key, int value, int number, int[] array) {
        myStruct = Struct(number);
        myStruct.myMap[key] = value;

        myArray = array;
    }

    function reset() {
        delete myArr;
        delete myStruct;
    }

    function deleteKey(int key) {
        delete myStruct.myMap[key];
    }
}
