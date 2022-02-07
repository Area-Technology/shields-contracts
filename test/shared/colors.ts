const colorMap = new Map([
  [0xfc03a5, 'radical red'],
  [0x5632a8, 'perfect pink'],
  [0x112233, 'bloo'],
  [0xaabbff, 'gothic green'],
])
const fieldColors = Array.from(colorMap.keys())
const titles = Array.from(colorMap.values())

export { colorMap, fieldColors, titles }
