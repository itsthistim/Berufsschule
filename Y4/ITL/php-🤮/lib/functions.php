<?php
function makeTable($sql, $colored_row = null)
{
    $conn = include 'modules\db.php';

    try {
        $stmt = $conn->prepare($sql);
        $stmt->execute();

        $meta = array();
        echo '<table class="table table-striped table-hover">';

        echo '<tr>';
        $colCount = $stmt->columnCount();
        for ($i = 0; $i < $colCount; $i++) {
            $meta[] = $stmt->getColumnMeta($i);
            echo '<th>' . $meta[$i]['name'] . '</th>';
        }
        echo '</tr>';

        while ($row = $stmt->fetch(PDO::FETCH_NUM)) {
            if ($colored_row == $row[1]) {
                echo '<tr class="table-success">';
            } else {
                echo '<tr>';
            }

            foreach ($row as $r) {
                echo '<td>' . $r . '</td>';
            }
            echo '</tr>';
        }

        echo '</table>';
    } catch (Exception $e) {
        echo "Error - Tabelle Adressen: " . $e->getCode() . $e->getMessage();
    }
}
?>