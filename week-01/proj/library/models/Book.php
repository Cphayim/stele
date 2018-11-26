<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "books".
 *
 * @property int $id ID
 * @property string $title 书名
 * @property string $isbn ISBN
 * @property string $author 作者
 * @property string $price 价格
 */
class Book extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'books';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'isbn'], 'required'],
            [['title'], 'string', 'max' => 30],
            [['isbn', 'price'], 'string', 'max' => 20],
            [['author'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '书名',
            'isbn' => 'ISBN',
            'author' => '作者',
            'price' => '价格',
        ];
    }
}
