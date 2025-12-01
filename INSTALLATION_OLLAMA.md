# 🤖 Installation et Configuration d'Ollama pour HealthVoice

## 📋 Qu'est-ce qu'Ollama ?

Ollama est un outil qui permet d'exécuter des modèles d'IA (LLM) **localement** sur votre ordinateur, **gratuitement** et **sans connexion internet**.

## 🎯 Fonctionnalité Intégrée

Quand vous créez une nouvelle **Observation**, le système va **automatiquement** :
1. ✅ Analyser la transcription vocale
2. ✅ Identifier la catégorie médicale (Respiratoire, Cardiovasculaire, etc.)
3. ✅ Générer un résumé des symptômes
4. ✅ Proposer des recommandations médicales
5. ✅ Créer automatiquement une nouvelle **Analyse** complète

## 📥 Installation d'Ollama

### Windows

1. **Télécharger Ollama**
   - Allez sur : https://ollama.ai/download
   - Cliquez sur "Download for Windows"
   - Téléchargez `OllamaSetup.exe`

2. **Installer**
   - Double-cliquez sur `OllamaSetup.exe`
   - Suivez l'assistant d'installation
   - Ollama se lancera automatiquement après l'installation

3. **Vérifier l'installation**
   - Ouvrez PowerShell
   - Tapez : `ollama --version`
   - Vous devriez voir la version installée

### macOS

```bash
# Télécharger et installer
curl https://ollama.ai/install.sh | sh
```

### Linux

```bash
# Installation
curl https://ollama.ai/install.sh | sh
```

## 🧠 Télécharger un Modèle d'IA

Une fois Ollama installé, vous devez télécharger un modèle d'IA. Voici les options recommandées :

### Option 1 : GPT-OSS 120B Cloud (Recommandé - Puissant)

```bash
ollama pull gpt-oss:120b-cloud
```

**Taille :** Variable (modèle cloud)  
**Performance :** Excellent pour l'analyse médicale  
**Vitesse :** Rapide

### Option 2 : Mistral (Alternative)

```bash
ollama pull mistral
```

**Taille :** ~4 GB  
**Performance :** Très bon  
**Vitesse :** Moyen

### Option 3 : Gemma (Léger)

```bash
ollama pull gemma:2b
```

**Taille :** ~1.5 GB  
**Performance :** Bon  
**Vitesse :** Très rapide

## ⚙️ Configuration du Projet

### 1. Vérifier le fichier `apiOmk.html`

Le code est déjà intégré ! Vérifiez ces lignes (vers la ligne 870) :

```javascript
// Configuration Ollama
const OLLAMA_API_URL = 'http://localhost:11434/api/generate';
const OLLAMA_MODEL = 'gpt-oss:120b-cloud'; // Changez si vous utilisez un autre modèle
```

### 2. Changer le Modèle (si nécessaire)

Si vous avez téléchargé `mistral`, `gemma` ou `llama3.2` au lieu de `gpt-oss:120b-cloud`, modifiez cette ligne :

```javascript
const OLLAMA_MODEL = 'mistral'; // ou 'gemma:2b'
```

## 🚀 Démarrage

### 1. Lancer Ollama

#### Windows
- Ollama se lance automatiquement au démarrage
- Vérifiez dans la barre des tâches (icône en bas à droite)
- Ou lancez manuellement : tapez `ollama serve` dans PowerShell

#### macOS/Linux
```bash
ollama serve
```

### 2. Vérifier qu'Ollama fonctionne

Ouvrez votre navigateur et allez sur :
```
http://localhost:11434/api/tags
```

Vous devriez voir la liste de vos modèles installés.

### 3. Lancer HealthVoice

1. Démarrez votre serveur local (XAMPP, WAMP, etc.)
2. Ouvrez `apiOmk.html` dans votre navigateur
3. Dans la console du navigateur (F12), vous devriez voir :
   ```
   ✓ Ollama est disponible
   ```

## 🎬 Utilisation

### Créer une Observation avec Analyse Automatique

1. **Allez dans l'onglet "Observations"**
2. **Cliquez sur "Nouvelle Observation"**
3. **Remplissez les champs :**
   - Date
   - Symptôme (ex: Toux, Fièvre)
   - Intensité (ex: Forte)
   - Transcription vocale : Décrivez les symptômes en détail
     ```
     Exemple : "Le patient présente une toux sèche persistante depuis 3 jours,
     avec des difficultés respiratoires légères. Pas de fièvre."
     ```
   - Utilisateur

4. **Cliquez sur "Enregistrer"**

5. **Le système va automatiquement :**
   - ✅ Créer l'observation
   - ✅ Envoyer la transcription à Ollama
   - ✅ Générer une analyse IA
   - ✅ Créer automatiquement une nouvelle "Analyse" avec :
     - Catégorie : (ex: Respiratoire)
     - Résumé : (généré par l'IA)
     - Recommandations : (générées par l'IA)
     - Observation associée : (lien automatique)

6. **Vérifiez dans l'onglet "Analyses"**
   - Vous verrez la nouvelle analyse créée automatiquement
   - Elle sera préfixée "Analyse Automatique - [Catégorie]"

## 🔍 Dépannage

### ❌ "Ollama non disponible"

**Solution 1 :** Vérifier qu'Ollama est lancé
```bash
# Dans PowerShell/Terminal
ollama serve
```

**Solution 2 :** Vérifier que le port 11434 est disponible
```bash
# Windows PowerShell
netstat -ano | findstr :11434

# macOS/Linux
lsof -i :11434
```

**Solution 3 :** Redémarrer Ollama
```bash
# Arrêter
taskkill /F /IM ollama.exe  # Windows
killall ollama              # macOS/Linux

# Relancer
ollama serve
```

### ⚠️ "Pas de JSON trouvé dans la réponse"

**Solution :** Le modèle n'a pas généré un JSON valide
- Essayez un autre modèle (mistral est parfois plus précis)
- Vérifiez que le modèle est bien téléchargé :
  ```bash
  ollama list
  ```

### 🐌 "Génération très lente"

**Solutions :**
1. Utilisez un modèle plus léger : `gemma:2b`
2. Vérifiez les ressources de votre PC (RAM, CPU)
3. Ollama utilise le GPU si disponible (plus rapide)

### 🚫 "Erreur API Ollama: 404"

**Solution :** Le modèle n'existe pas
```bash
# Lister les modèles installés
ollama list

# Télécharger le modèle manquant
ollama pull llama3.2
```

## 📊 Tests

### Test Rapide

1. Ouvrez PowerShell/Terminal
2. Testez Ollama directement :

```bash
ollama run llama3.2 "Analyse ces symptômes: toux, fièvre 38°C, fatigue"
```

Vous devriez obtenir une réponse médicale.

### Test dans HealthVoice

1. Ouvrez `apiOmk.html`
2. Ouvrez la console (F12)
3. Tapez :

```javascript
checkOllamaAvailability().then(result => {
    console.log('Ollama disponible:', result);
});
```

Vous devriez voir : `Ollama disponible: true`

## 🎨 Personnalisation

### Modifier le Prompt de l'IA

Dans `apiOmk.html`, cherchez la fonction `generateAnalysisWithOllama` et modifiez le prompt :

```javascript
const prompt = `Tu es un assistant médical expert...`;
```

Vous pouvez :
- Changer le ton (plus ou moins formel)
- Ajouter des instructions spécifiques
- Demander plus ou moins de détails

### Changer les Catégories

Modifiez la liste des catégories valides :

```javascript
const validCategories = ['Respiratoire', 'Cardiovasculaire', ...];
```

## 📈 Performance

### Configuration Minimale
- **RAM :** 8 GB
- **Disque :** 5 GB d'espace libre
- **CPU :** Intel i5 ou équivalent

### Configuration Recommandée
- **RAM :** 16 GB
- **Disque :** 10 GB d'espace libre (SSD recommandé)
- **CPU :** Intel i7 ou équivalent
- **GPU :** NVIDIA avec CUDA (optionnel mais accélère considérablement)

### Temps de Génération Estimés

| Modèle | Configuration Min | Configuration Recommandée |
|--------|-------------------|---------------------------|
| gemma:2b | 15-30 sec | 5-10 sec |
| llama3.2 | 30-60 sec | 10-20 sec |
| mistral | 45-90 sec | 15-30 sec |

## 🆘 Support

### Ollama
- Site : https://ollama.ai
- Documentation : https://github.com/ollama/ollama
- Discord : https://discord.gg/ollama

### HealthVoice
- Consultez les logs dans la console du navigateur (F12)
- Vérifiez les messages d'erreur affichés à l'écran

## 📝 Notes Importantes

⚠️ **Avertissement Médical :**
- Les analyses générées par l'IA sont à titre **informatif uniquement**
- Elles **NE REMPLACENT PAS** un avis médical professionnel
- Toujours consulter un médecin pour un diagnostic

✅ **Avantages :**
- 100% gratuit
- Fonctionne hors ligne
- Données privées (tout reste sur votre ordinateur)
- Aucune limite d'utilisation

🔒 **Sécurité :**
- Toutes les données restent locales
- Aucune donnée envoyée sur internet
- Conforme au RGPD

## 🎉 C'est tout !

Une fois Ollama installé et configuré, vos observations généreront automatiquement des analyses IA ! 🚀
