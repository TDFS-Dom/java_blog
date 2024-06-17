package utc.edu.vn.constant;

/**
 * 日志表的action字段
 */
public enum LogActions {

    LOGIN("Đăng nhập vào nền"),
    UP_PWD("Đổi mật khẩu"),
    UP_INFO("Sửa đổi thông tin cá nhân"),
    DEL_ARTICLE("Xóa bài viết"),
    SYS_SETTING("Lưu cài đặt hệ thống"),
    DEL_ATTACH("Xóa tệp đính kèm");

    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    LogActions(String action) {
        this.action = action;
    }

}
