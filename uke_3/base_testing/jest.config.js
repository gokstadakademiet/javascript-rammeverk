const config = {
    transform: {
        "^.+\\.[t|j]sx?$": "babel-jest"
    },
    testEnvironment: "jsdom",

    setupFilesAfterEnv: ["<rootDir>/setupTests.js"],
};

export default config;