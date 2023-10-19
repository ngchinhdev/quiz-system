<form action="../controllers/userController.php?page=edit-user&id=<?= $user_id ?>" method="POST">
    <div class="title">
        <h2>Cập nhật vai trò <span class="err"></span></h2>
    </div>
    <div class="general">
        <div class="general__row row-1">
            <div class="box">
                <label for="role-user">Vai trò (Nhập 1 hoặc 2 - Admin/User)</label>
                <input type="text" value="" name="role-user" id="role-user" class="inp user--role">
                <input type="submit" name="submit" class="btn-submit-user" value="Cập nhật">
            </div>
        </div>
    </div>
</form>