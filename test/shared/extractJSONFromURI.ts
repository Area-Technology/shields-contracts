type attribute = {
  trait_type: string
  value: string
}

export function extractJSONFromURI(uri: string): {
  name: string
  description: string
  image: string
  attributes: Array<attribute>
} {
  const encodedJSON = uri.substr('data:application/json;base64,'.length)
  const decodedJSON = Buffer.from(encodedJSON, 'base64').toString('utf8')
  return JSON.parse(decodedJSON)
}
