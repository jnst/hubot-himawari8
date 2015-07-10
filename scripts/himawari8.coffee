# Description:
#   Himawari 8 is Japanese weather satellite
#
# Dependencies:
#   "moment": "2.10.3"
#
# Commands:
#   hubot himawari8 - show the Japan Meteorological Agency's image
#
# Author:
#   Jun Sato

moment = require('moment');

module.exports = (robot) ->

  delimitBy30 = ->
    m = moment()
    min = +m.format('m')
    switch (min)
      when (min < 5) then m.subtract(1, 'hours').minutes(30)
      when (min < 35) then m.minutes(0)
      else m.minutes(30)

  robot.respond /himawari8$/i, (msg) ->
    dateStr = delimitBy30().format('YYYYMMDDHHmm')
    msg.send "http://www.jma.go.jp/jp/gms/imgs_c/0/visible/0/#{dateStr}-00.png"
