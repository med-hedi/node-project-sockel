/* eslint-disable jsdoc/require-jsdoc */
/* eslint-disable jsdoc/require-param */
/* eslint-disable jsdoc/require-returns */
/**
 * @type {import('ts-jest').JestConfigWithTsJest}
 * Type annotation for Jest config with ts-jest
 */
module.exports = {
  preset: "ts-jest", // Use ts-jest preset for TypeScript support
  testEnvironment: "node", // Set the test environment to Node.js
  testMatch: ["**/tests/**/*.test.ts"], // Only run test files matching this pattern
};
