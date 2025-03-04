local _M = {}

local config = {
    -- Turn the waf on or off
    waf = "on",
    -- Specify the working mode of this waf,The following option characters are supported:
    -- monitor: Record attack logs but do not intercept attack requests
    -- protection: Intercept attack requests and record attack logs
    mode = "protection",

    -- 开启规则自动排序，开启后按规则命中次数降序排序，可以提高拦截效率
    rules_sort = "off",
    -- 规则每隔多少秒排序一次
    rules_sort_period = 60,

    -- 攻击日志
    attackLog = "on",
    -- 攻击日志输出为json格式
    attackLog_json_format = "off",
    -- waf日志文件路径
    logPath = "/usr/local/openresty/nginx/logs/hack/",
    -- 规则文件路径
    rulePath = "/usr/local/openresty/zhongkui-waf/rules/",

    -- 开启ip地理位置识别
    geoip = "on",
    -- geoip数据文件路径
    geoip_db_file = "/usr/local/share/GeoIP/GeoLite2-City.mmdb",
    -- 允许哪些国家的ip请求，其值为大写的ISO国家代码，如CN，如果设置为空值则允许所有
    geoip_allow_country = {},
    -- geoip显示语言，默认中文
    geoip_language = "zh-CN",

    -- 开启ip白名单
    whiteIP = "on",
    -- ip白名单列表，支持网段配置，"127.0.0.1/24"或"127.0.0.1/255.255.255.0"
    ipWhiteList = {"127.0.0.1"},

    -- 开启ip黑名单
    blackIP = "on",
    -- ip黑名单列表，支持网段配置，"127.0.0.1/24"或"127.0.0.1/255.255.255.0"，也可以配置在./rules/ipBlackList文件中
    ipBlackList = {},

    -- url白名单
    whiteURL = "on",
    -- url黑名单
    blackURL = "on",

    -- http方法白名单
    methodWhiteList = {"GET","POST","HEAD"},
    -- 请求体检查
    requestBodyCheck = "off",
    -- 上传文件类型黑名单
    fileExtBlackList = {"php","jsp","asp","exe","sh"},
    -- 上传文件内容检查
    fileContentCheck = "off",

    -- cookie检查
    cookie = "off",

    -- bot管理
    bot = "off",
    -- 开启bot陷阱
    bot_trap = "off",
    -- 陷阱URI，隐藏在页面中，对普通正常用户不可见，访问此URI的请求被视为bot，建议安装后修改
    bot_trap_uri = "/zhongkuiwaf/honey/trap",
    -- 被陷阱捕获后的处置动作
    bot_trap_action = "deny",
    -- 访问陷阱URI后屏蔽ip
    bot_trap_ip_block = "off",
    -- ip禁止访问时间，单位是秒，如果设置为0则永久禁止
    bot_trap_ip_block_timeout = 60,

    -- cc攻击拦截
    cc_defence = "on",
    -- 浏览器验证失败几次后自动拉黑IP地址，需要将autoIpBlock设置为on
    cc_max_fail_times = 5,
    -- 处置动作超时时间，单位是秒
    cc_action_timeout = 60,
    -- 验证请求来自于真实浏览器后，浏览器cookie携带的访问令牌有效时间，单位是秒
    cc_accesstoken_timeout = 1800,

    -- 密钥,用于请求签名等，可任意修改，建议长度长一点
    secret = "2215D605B798A5CCEB6D5C900EE3585B",

    -- 敏感数据脱敏
    sensitive_data_filtering = "off",

    -- Redis支持，打开后请求频率统计及ip黑名单将从Redis中存取
    redis = "off",
    redis_host = "",
    redis_port = "6379",
    redis_passwd = "",
    redis_ssl = false,
    redis_pool_size = "10",
    -- Respectively sets the connect, send, and read timeout thresholds (in ms)
    redis_timeouts = "1000,1000,1000",

    -- 是否重定向
    redirect = "on",
    -- 非法请求将重定向的html
    redirect_html = "/usr/local/openresty/zhongkui-waf/redirect.html",

    -- 流量监控页面
    dashboard = "off",
    dashboard_html = "/usr/local/openresty/zhongkui-waf/dashboard/dashboard.html"
}


function _M.get(option)
    return config[option]
end
-- Returns true if the config option is "on",otherwise false
function _M.isOptionOn(option)
	return config[option] == "on" and true or false
end

return _M