# Description:
#   Give your bot a default home page.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Notes:
#   Visit your hubot at $HOSTNAME:$PORT to see this page.
#
# Author:
#   stephenyeargin

module.exports = (robot) ->
  robot.router.get '/', (req, res) ->
    output = "<html>"
    output += "<head>"
    output += "<title>#{robot.name}</title>"
    output += "<style>img { position: fixed; top:50%; left: 50%; transform: translate(-50%, -50%); }</style>"
    output += "</head>"
    output += "<body>"
    output += "<img src='//octodex.github.com/images/hubot.jpg' width='300' height='300' />"
    output += "</body>"
    output += "</html>"
    res.send output
