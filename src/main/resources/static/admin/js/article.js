/**
 * Created by 13 on 2017/2/22.
 */
// Tags Input
$('#tags').tagsInput({
    width: '100%',
    height: '35px',
    defaultText: 'Vui lòng nhập thẻ bài viết'
});

$('.toggle').toggles({
    on: true,
    text: {
        on: 'Bật',
        off: 'Tắt'
    }
});

$(".select2").select2({
    width: '100%'
});

var tale = new $.tale();

/**
 * 保存文章
 * @param status
 */
function subArticle(status) {
    var title = $('#articleForm input[name=title]').val();
    var content = $('#text').val();
    if (title == '') {
        tale.alertWarn('Vui lòng nhập tiêu đề bài viết');
        return;
    }
    if (content == '') {
        tale.alertWarn('Vui lòng nhập nội dung bài viết');
        return;
    }
    $('#content-editor').val(content);
    $("#articleForm #status").val(status);
    $("#articleForm #categories").val($('#multiple-sel').val());
    $("#articleForm #type").val($('#multiple-type').val());
    var params = $("#articleForm").serialize();
    console.log(params);
    var url = $('#articleForm #cid').val() != '' ? '/admin/article/modify' : '/admin/article/publish';
    tale.post({
        url:url,
        data:params,
        success: function (result) {
            if (result && result.code == 'success') {
                tale.alertOk({
                    text:'Bài viết đã được lưu thành công',
                    then: function () {
                        setTimeout(function () {
                            window.location.href = '/admin/article';
                        }, 500);
                    }
                });
            } else {
                tale.alertError(result.msg || 'Không lưu được bài viết');
            }
        }
    });
}


function allow_comment(obj) {
    var this_ = $(obj);
    var on = this_.find('.toggle-on.active').length;
    var off = this_.find('.toggle-off.active').length;
    if (on == 1) {
        $('#allow_comment').val(false);
    }
    if (off == 1) {
        $('#allow_comment').val(true);
    }
}

function allow_ping(obj) {
    var this_ = $(obj);
    var on = this_.find('.toggle-on.active').length;
    var off = this_.find('.toggle-off.active').length;
    if (on == 1) {
        $('#allow_ping').val(false);
    }
    if (off == 1) {
        $('#allow_ping').val(true);
    }
}


function allow_feed(obj) {
    var this_ = $(obj);
    var on = this_.find('.toggle-on.active').length;
    var off = this_.find('.toggle-off.active').length;
    if (on == 1) {
        $('#allow_feed').val(false);
    }
    if (off == 1) {
        $('#allow_feed').val(true);
    }
}

$('div.allow-false').toggles({
    off: true,
    text: {
        on: 'Bật',
        off: 'Tắt'
    }
});

$('#multiple-type').change(function () {
    var postType = $('#multiple-type').val();
    var tags = $('#tags');
    var categories = $('#multiple-sel');
    if(postType == 'post'){
        $('#tags_tagsinput').show(500);
        $('#s2id_multiple-sel').show(500);
        $('#comment-div').attr("style","display:block;");
    }else {
        $('#tags_tagsinput').hide(500);
        $('#s2id_multiple-sel').hide(500);
        $('#comment-div').attr("style","display:none;");

    }
});

$(function () {
    var postType = $('#multiple-type').val();
    var tags = $('#tags');
    var categories = $('#multiple-sel');
    if(postType == 'post'){
        $('#tags_tagsinput').show();
        $('#s2id_multiple-sel').show();
        $('#comment-div').attr("style","display:block;");
    }else {
        $('#tags_tagsinput').hide();
        $('#s2id_multiple-sel').hide();
        $('#comment-div').attr("style","display:none;");

    }
});
