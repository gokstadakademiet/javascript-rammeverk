const config = {
    transform: {
        "^.+\\.[t|j]sx?$": "babel-jest"
    },
    testEnvironment: "jsdom",

    setupFilesAfterEnv: ["<rootDir>/src/setupTests.js"],
};

export default config;