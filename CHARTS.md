# Testing Helm Charts

Ce repository contient une structure pour tester les releases Helm avec gestion automatisée des versions.

## Structure du projet

```
charts/
├── library/
│   ├── common/          # Chart library commune avec helpers et templates réutilisables
│   └── common-test/     # Chart de test utilisant la chart common
└── apps/
    ├── webapp/          # Application Web (utilise common)
    └── api/             # Service API (utilise common)
```

## Charts disponibles

### Library Charts

#### `common` (v0.1.0)
Chart library fournissant des templates et helpers réutilisables :
- Helpers pour les noms, labels et sélecteurs
- Valeurs par défaut pour image, service, resources
- Configuration de sécurité (SecurityContext, ServiceAccount)

#### `common-test` (v0.1.0)
Chart de test démontrant l'utilisation de la chart `common` :
- ConfigMap de test
- ServiceAccount utilisant les helpers

### Application Charts

#### `webapp` (v0.1.0)
Application web utilisant la chart `common` :
- 2 replicas par défaut
- Image Nginx
- AutoScaling activé (min: 2, max: 5)
- Service ClusterIP sur le port 80

#### `api` (v0.1.0)
Service API utilisant la chart `common` :
- 3 replicas par défaut
- Image Python
- AutoScaling activé (min: 3, max: 10)
- Service ClusterIP sur le port 5000

## Installation

### Prérequis
- Helm 3.x
- Kubernetes cluster

### Installation locale

```bash
# Installer la webapp
helm install my-webapp ./charts/apps/webapp

# Installer l'API
helm install my-api ./charts/apps/api

# Installer la chart de test
helm install my-test ./charts/library/common-test
```

### Mise à jour des dépendances

Pour les charts avec dépendances sur la `common` chart :

```bash
helm dependency update ./charts/library/common-test
helm dependency update ./charts/apps/webapp
helm dependency update ./charts/apps/api
```

## CI/CD

Deux workflows GitHub Actions sont configurés :

### `lint.yaml`
Exécution sur chaque push vers `main` ou PR modifiant les charts :
- Lint de tous les charts avec `helm lint`
- Test de template avec `helm template`
- Mise à jour des dépendances

### `release.yaml`
Exécution sur chaque push vers `main` modifiant les charts :
- Détection des charts modifiés
- Mise à jour automatique des versions (patch version)
- Packaging des charts
- Génération d'un index Helm
- Création d'une release GitHub avec les archives `.tgz`

## Gestion des versions

Les versions sont automatiquement incrémentées en patch version par le workflow `release.yaml` :
- `0.1.0` → `0.1.1` → `0.1.2` ...

Pour une release majeure ou mineure, mettre à jour manuellement dans `Chart.yaml` :

```yaml
version: 0.2.0  # mineure
version: 1.0.0  # majeure
```

## Utiliser les charts depuis une release

```bash
# Ajouter le repo
helm repo add my-charts https://github.com/trowaflo/testing-helm-charts/releases/download/charts/

# Mettre à jour le repo
helm repo update

# Installer un chart
helm install my-release my-charts/webapp
```

## Développement

### Linter les charts
```bash
helm lint ./charts/library/common
helm lint ./charts/apps/webapp
```

### Valider les templates
```bash
helm template test-release ./charts/apps/webapp
```

### Packager un chart
```bash
helm package ./charts/apps/webapp -d ./dist
```

## Notes

- La chart `common` est de type `library` et ne peut pas être installée directement
- Les charts `common-test`, `webapp` et `api` dépendent de la chart `common`
- Tous les charts utilisent les helpers et labels de la chart `common`
