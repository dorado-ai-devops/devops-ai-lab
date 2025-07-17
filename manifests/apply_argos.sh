#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="argocd"
ROOT_DIR="$(pwd)"

echo "🌱 Aplicando todos los ArgoCD AppManifests en namespace '$NAMESPACE'..."

# Asegúrate de que el namespace exista
kubectl get ns $NAMESPACE &>/dev/null || {
  echo "⚠️  Namespace '$NAMESPACE' no existe. Créalo con: kubectl create namespace $NAMESPACE"
  exit 1
}

# Para cada subcarpeta que contenga un directorio 'argocd'
for d in "$ROOT_DIR"/*/argocd; do
  [ -d "$d" ] || continue
  echo -e "\n▶️  Carpeta: $d"
  # Aplica cada YAML salvo values.yaml
  for y in "$d"/*.yaml; do
    # ignora values.yaml
    if [[ "$(basename "$y")" == "values.yaml" ]]; then
      continue
    fi
    echo "   → kubectl apply -n $NAMESPACE -f $y"
    if ! kubectl apply -n $NAMESPACE -f "$y"; then
      echo "     ❌ Error al aplicar $y, se continúa con el siguiente."
    fi
  done
done

echo -e "\n✅ Aplicación de ArgoCD Apps completada."
