module.exports =
  index: (req, res, next)->
    return next() if (req.url.match(/\..*/g) || req.url.match(/^\/api\/.*$/))
    return res.view('index')
