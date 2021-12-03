module.exports = {
  description: 'valid multi-point geometry',
  specification_reference: 'https://github.com/mapbox/vector-tile-spec/tree/master/2.1#4352-example-multi-point',
  validity: {
    v1: true,
    v2: true
  },
  json: {
    layers: [
      {
        version: 2,
        name: 'hello',
        features: [
          {
            id: 1,
            tags: [0, 0],
            type: 1, // point enum
            geometry: [ 17, 10, 14, 3, 9 ]
          }
        ],
        keys: [
          'hello'
        ],
        values: [
          { string_value: 'world' }
        ],
        extent: 4096
      }
    ]
  },
  proto: '2.1'
};
