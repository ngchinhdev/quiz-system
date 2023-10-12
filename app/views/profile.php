<section class="profile">
    <div class="profile__container">
        <div class="profile__container--informations">
            <div class="left--site">
                <?php 
                    if(isset($_COOKIE['is_user'])) {
                        echo '<div class="avatar">
                                <img src="'.$_COOKIE['avatar'].'" alt="">
                            </div>
                            <div class="details">
                                <h3>'.$_COOKIE['name'].'</h3>
                                <p>'.$_COOKIE['email'].'</p>
                            </div>';
                    }
                ?>
            </div>
            <a href="../controllers/logoutController.php" class="log--out">Đăng xuất</a>
        </div>
        <div class="profile__container--nav">
            <div class="nav--tab">
                <div class="history--tab tab active">Lịch sử làm bài</div>
            </div>
            <hr>
        </div>
        <div class="profile__container--rows">
           
        </div>
        <ul class="profile__container--pagination">
           
        </ul>
        <ul class="profile__list--results">

        </ul>
    </div>
</section>