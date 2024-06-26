/**
 * Created by 13 on 2017/2/23.
 */
!function ($) {
    "use strict";
    var tale = new $.tale();
    var FormWizard = function () {
    };
    //creates form with validation
    FormWizard.prototype.init = function () {
        var $form_container = $("#wizard-validation-form");
        $form_container.validate({
            errorPlacement: function errorPlacement(error, element) {
                element.after(error);
            }
        });
        $("#steps").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "fade",
            labels: {
                previous: "Bước trước",
                next: "Bước tiếp theo",
                finish: "Hoàn thành",
                loading: 'Đang tải...',
                current: 'Bước hiện tại'
            },
            onStepChanging: function (event, currentIndex, newIndex) {
                tale.showLoading();
                $form_container.validate().settings.ignore = ":disabled,:hidden";
                var isValid=true;
                if(newIndex!=0){
                     isValid = $form_container.valid();
                    if(!isValid){
                        tale.hideLoading();
                    }
                }
                if (isValid && currentIndex == 1&&newIndex==2) {
                    isValid = false;
                    var params = $form_container.serialize();
                    tale.post({
                        url: '/install/testCon',
                        data: params,
                        success: function (result) {
                            if (result && result.code == 'success') {
                                tale.showLoading();
                                tale.post({
                                    url: '/install',
                                    data: params,
                                    success: function (result) {
                                        if (result && result.code == 'success') {
                                            isValid = true;
                                        } else {
                                            if (result.msg) {
                                                tale.alertError(result.msg || 'Cài đặt thất bại');
                                            }
                                        }
                                    }
                                });
                            } else {
                                tale.alertError(result.msg || 'Kết nối thử nghiệm không thành công');
                            }
                        }
                    });
                    return isValid;
                } else {
                    tale.hideLoading();
                    return isValid;
                }
            },
            onStepChanged: function (event, currentIndex) {
                tale.hideLoading();
            },
            onFinishing: function (event, currentIndex) {
                $form_container.validate().settings.ignore = ":disabled";
                var isValid = $form_container.valid();
                window.location.href = "/admin/login";
                return isValid;
            },
            onFinished: function (event, currentIndex) {
                window.location.href = "/admin/login";
            }
        });
        return $form_container;
    },
        //init
        $.FormWizard = new FormWizard, $.FormWizard.Constructor = FormWizard
}(window.jQuery), $.FormWizard.init();