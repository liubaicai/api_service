/**
 * Created by Baicai on 2017/8/30.
 */

var vm = new Vue({
    el: '#root',
    data: {
        links:null,
        article:null,
        admin:'刘白菜',
        email:'liushuai.baicai@hotmail.com',
        url:'http://www.liubaicai.net/',
        domain: 'liubaicai.net',
        footer: 'Powerby<a href="http://weibo.com/liubaicai" target="_blank">@刘白菜</a>，项目源码托管于<a href="https://github.com/liubaicai/baicai_rails_blog" target="_blank">GitHub</a>'
    },
    computed: {
        now_year: function () {
            var date = new Date();
            return date.getFullYear();
        }
    },
    created: function () {
        var that = this
        this.getArticle(that.getUrlKey('id')||1).then(function (data) {
            that.article = data["data"];
        })
        this.getLinks().then(function (data) {
            that.links = data["data"]
        })
    },
    methods: {
        getArticle(id){
            return Vue.http.get(`/api/articles/${id}`)
                .then(function (data) {
                    if (data.status === 200) {
                        return data.body;
                    }
                });
        },
        getLinks(){
            return Vue.http.get(`/api/links`)
                .then(function (data) {
                    if (data.status === 200) {
                        return data.body;
                    }
                })
        },
        getTime(strTime){
            return new Date(strTime).toDateString();
        },
        getUrlKey:function(name){
            return decodeURIComponent((new RegExp('[?|&]'+name+'='+'([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g,'%20'))||null;
        },
        navTo(url){
            window.location = url;
        },
    },
})