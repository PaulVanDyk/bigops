/**
 * Created by dream on 2017/3/19.
 */
var User = function () {

    var _validate;
    var gridUser = new Datatable();

    /**
     * 初始化页面插件
     * @private
     */
    var _initPlugin = function () {

    };

    /**
     * 初始化页面事件
     * @private
     */
    var _bindHandle = function () {
        var bakDirect;
        $("#dt_user").on("click", "a[name='directButton']", function () {
            if (bakDirect && bakDirect === this) {
                $(".direct").toggleClass("direct-open");
            } else {
                bakDirect = this;
                $(".direct").toggleClass("direct-open", true);
            }
        });

        $(document).on("click", "#showAll", function () {
            var selected = $('#tree_org').jstree().get_selected(true);
            if ($(this).prop("checked")) {
                var params = "params=depth:true,organizationId:";
                params += selected ? selected[0].id : "0";
                Layout.loadAjaxContent('/user/indexAjax.do?' + params, $(selected[0]))
            } else {
                var params = "params=organizationId:";
                params += selected ? selected[0].id : "0";
                Layout.loadAjaxContent('/user/indexAjax.do?' + params, $(selected[0]))
            }
        })
    };

    /**
     * 初始化数据列表
     * @private
     */
    var _initTable = function () {
        gridUser.init({
            src: $("#dt_user"),
            loadingMessage: 'Loading...',
            dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options
                "bAutoWidth": true,
                "ordering": false,
                "pageLength": 10, // default record count per pag
                "pagingType": "bootstrap_full_number",
                "ajax": {
                    "url": contextPath + "/user/findUserList.do" // ajax source
                },
                "columns": [
                    {"data": "realname"},
                    {"data": "email"},
                    {"data": "mobile"},
                    {"data": "employId"},
                    {"data": "expires"},
                    {"data": "lastLoginIp"},
                    {"data": "status"}
                ],
                "columnDefs": [
                    {
                        "targets": [0],
                        "data": "realname",
                        "render": function (data, type, full) {
                            return '<a href="javascript:;"  name="directButton" id="' + type.uid + '">' + data + '</a>';
                        }
                    },
                    //     {
                    //         "targets": [7],
                    //         "data": "uid",
                    //         "render": function (data, type, full) {
                    //             if (full.status == 1) {
                    //                 return '<button type="button" class="btn btn-sm btn-warning" data-type="edit" data-val="' + data + '">编辑</button><button type="button" class="btn btn-sm btn-danger" data-type="delete" data-val="' + data + '">删除</button>';
                    //             } else {
                    //                 return '<button type="button" class="btn btn-sm btn-default" data-type="show" data-val="' + data + '">查看</button>';
                    //             }
                    //
                    //         }
                    //     }
                ]
            }
        });
    };

    var _initParam = function (params) {
        if (params) {
            $(params).each(function () {
                gridUser.setAjaxParam(this.key, this.value);
            });
        }
    }

    return {
        init: function (params) {
            _initParam(params);
            _initPlugin();
            _bindHandle();
            _initTable();
        }
    }
}
();
function arrayToJson(array) {
    var o = {};
    $.each(array, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};