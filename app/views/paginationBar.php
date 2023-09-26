<ul class="exams__pagination">
    <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
        <li class="page--item">
            <a href="#" id="<?= $i ?>"></a>
        </li>
    <?php } ?>
    <li class="page--item">
        <a href="#"><i class="fa-sharp fa-solid fa-angle-right"></i></a>
    </li>
</ul>