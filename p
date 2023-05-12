let fetch = require('node-fetch')
let fs = require('fs')
let handler = async (m, { conn, usedPrefix, args, command, text }) => {
if (!args[0]) throw `Linknya?`
  let res = await fetch(`https://tikly.api-kyouka.my.id/get-tiktok-video.php?url=${text}`)
  let json = await res.json()
  let cap = `*Author*: ${json.result.author.name}\n${json.result.title}\nDurasi: ${json.result.video.durationFormatted}\nShare: ${json.result.stats.shareCount}\nKomen: ${json.result.stats.commentCount}\nPlay: ${json.result.stats.playCount}\nSave: ${json.result.stats.saveCount}`
  conn.sendFile(m.chat, json.result.video.noWatermark, cap, cap, m)
}
handler.help = ['tiktok','ttdl']
handler.tags = ['downloader']
handler.command = /^(tiktokdl|ttdl|tiktok|tt)$/i
module.exports = handler
