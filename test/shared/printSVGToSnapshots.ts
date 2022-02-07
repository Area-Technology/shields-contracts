import fs from 'fs'

export function printSVGToSnapshots(type: string, title: string, svgString: string) {
  fs.writeFileSync(`./test/__snapshots__/svgs/${type}/${title}.svg`, svgString)
}
