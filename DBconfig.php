<?php

/*class Database
{

    private $host;
    private $db;
    private $user;
    private $pass;
    private $charset;
    private $pdo;

    function __construct()
    {
        $this->host = '127.0.0.1';
        $this->db   = 'webshop'; //name databse
        $this->user = 'root';
        $this->pass = '';
        $this->charset = 'utf8mb4';

        $dsn = "mysql:host=$this->host;dbname=$this->db;charset=$this->charset";
        $options = [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ];
        try {
            $this->pdo = new PDO($dsn, $this->user, $this->pass, $options);
        } catch (\PDOException $e) {
            throw new PDOException($e->getMessage(), (int)$e->getCode());
        }
    }
//default select <bij LucasFlowerPower is $sql -> $statement
    public function select($sql, $named_placeholder = [])
    {
        // prepared statement (send statement to server  + checks syntax)
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($named_placeholder);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        //reutrn alleen resultatenset als er data in zit. 
        if (!empty($result)) {
            return $result;
        }
        return;
    }
}
*/
DEFINE("USER", 'root');
DEFINE("PASSWORD", '');
try {
    $verbinding = new PDO("mysql:host=localhost; dbname=webshop", USER, PASSWORD);
    $verbinding -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo $e->getMessage();
    echo "Kon geen verbinding maken";
}
?>