contract Sample5 {
    mapping (int => string) myMap;

    function sample(int key, string val) {
        myMap[key] = val;

        mapping (int => string) myMap2 = myMap;
    }
}
