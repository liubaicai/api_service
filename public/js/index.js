/**
 * Created by Baicai on 2017/8/30.
 */

var vm = new Vue({
    el: '#root',
    data: {
        articles:null,
        categories:null,
        links:null,
        pageNo:0,
        pageCount:1,
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
        this.getArticles(that.getUrlKey('page')||1).then(function (data) {
            that.articles = data["data"];
            that.pageNo = (that.getUrlKey('page')||1)-1;
            that.pageCount = Math.ceil((data["total"])/(data["per_page"]));
        })
        this.getLinks().then(function (data) {
            that.links = data["data"]
        })
    },
    methods: {
        getArticles (page) {
            return Vue.http.get(`/api/articles?page=${page||1}&per_page=5`)
                .then(function (data) {
                    if (data.status === 200) {
                        return data.body;
                    }
                });
        },
        getCategories(){
            return Vue.http.get(`/api/categories`)
                .then(function (data) {
                    if (data.status === 200) {
                        return data.body;
                    }
                })
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
        pageNoClick: function(pageNum) {
            this.navTo('/?page='+pageNum);
//                var that = this
//                this.getArticles(pageNum).then(function (data) {
//                    window.scrollTo(0,0);
//                    that.articles = data["data"];
//                    that.pageNo = 1;
//                    that.pageCount = Math.ceil((data["total"])/(data["per_page"]));
//                })
        }
    },
})

Vue.component('paginate', VuejsPaginate)