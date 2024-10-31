const config = {
    transform: {
        "^.+\\.[t|j]sx?$": "babel-jest"
    },
    testEnvironment: "jsdom",
};

export default config;