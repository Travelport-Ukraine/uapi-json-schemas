const schemas = require('./');

describe('jsonix-schema test', () => {
    it('should include all 8 schemas', () => {
        expect(Object.keys(schemas)).toHaveLength(8);
    });
});