const schemas = require('./');

describe('json-schema tests', () => {
    it('should export all 8 json schemas', () => {
        expect(Object.keys(schemas)).toHaveLength(8);
    });
});