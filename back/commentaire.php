<?php
include "./bdd.php";
header('Content-Type: application/json');

// Gestion des commentaires en fonction de la méthode HTTP
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Récupération des commentaires
    try {
        $id_enclosure = isset($_GET['id_enclosure']) ? intval($_GET['id_enclosure']) : 0;
        
        if (!$id_enclosure) {
            throw new Exception('ID enclos manquant');
        }

        $stmt = $conn->prepare("
            SELECT pseudo, note, commentaire 
            FROM comments 
            WHERE id_enclosure = ? 

        ");
        
        $stmt->execute([$id_enclosure]);
        $result = $stmt->get_result();
        $result->fetch_assoc();
        $comments=[];
        foreach($result as $row){
            $comments[]=$row;
        }
        
        echo json_encode([
            'success' => true,
            'comments' => $comments
        ]);

    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode(['error' => $e->getMessage()]);
    }
} 
else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sauvegarde d'un nouveau commentaire

try {
    // Récupérer les données JSON
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Valider les données
    if (!isset($data['id_enclosure'], $data['username'], $data['rating'], $data['comment'])) {
        throw new Exception('Données manquantes');
    }
    
    // Préparer la requête
    $stmt = $conn->prepare("
        INSERT INTO comments (id_enclosure, pseudo, note, commentaire)
        VALUES (?, ?, ?, ?)
    ");
    
    // Exécuter la requête
    $stmt->execute([
        $data['id_enclosure'],
        $data['username'],
        $data['rating'],
        $data['comment']
    ]);
    
    // Réponse success
    echo json_encode(['success' => true]);
    
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode(['error' => $e->getMessage()]);
}

} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(['error' => 'Méthode non autorisée']);
}
?>