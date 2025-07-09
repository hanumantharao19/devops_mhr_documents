
# 📘 Google Cloud Service Accounts – Complete Guide

This document explains everything you need to know about **Service Accounts** in Google Cloud Platform (GCP), including what they are, how they work, impersonation, IAM policies, and cross-project usage.

---

## 🔑 What is a Service Account?

A **Service Account** is a special Google identity (like a robot) used by:
- Applications
- Scripts
- VMs
- CI/CD tools (like Jenkins, Cloud Build)

Service accounts are **not human users**, but they have an **email ID** and can be granted **IAM roles** to interact with GCP resources securely.

### 📌 Example Service Account Email:
```text
ci-deploy@my-project.iam.gserviceaccount.com
```

---

## 🎯 Why Use Service Accounts?

- Provide authentication and authorization for automation
- Allow apps to act securely without exposing user credentials
- Support automation across GCP services like GCS, Compute Engine, GKE, etc.

---

## 🧩 Types of IAM Members

| Type         | Example                                   | Use Case                   |
|--------------|--------------------------------------------|-----------------------------|
| User         | user:alice@gmail.com                      | Real human user             |
| Group        | group:devops-team@mycompany.com           | Multiple users as one unit |
| ServiceAccount| serviceAccount:ci-deploy@my-project.iam.gserviceaccount.com | Apps/tools/automation       |

---

## 🔐 IAM Roles for Service Accounts

1. **Roles given TO a service account**: Controls **what the service account can do** (e.g., create VMs, write to GCS).
2. **Roles on the service account**: Controls **who can use or impersonate** the service account.

---

## 🧑‍💻 Impersonation – What Does It Mean?

> Impersonation means acting as the service account — using its identity and permissions to perform actions.

To impersonate a service account, a user/tool must be granted:
```bash
roles/iam.serviceAccountUser
```
on the service account.

### 🔄 Example:
```bash
gcloud compute instances create my-vm   --impersonate-service-account=ci-deploy@my-project.iam.gserviceaccount.com
```

### ⚠️ Important:
Just giving `roles/editor` to the service account is not enough — someone must also be granted permission to impersonate it if they want to act on its behalf.

---

## 🛠️ Using Service Accounts with VMs

When you attach a service account to a VM:
- The VM **automatically acts as** that service account
- It does **not need impersonation permissions**

### ✅ You only need to:
- Attach the service account
- Make sure the service account has necessary roles (e.g., `roles/compute.admin`)

---

## 🔄 Project IAM Member vs Service Account IAM Member

| Type                        | Controls                         | Example |
|-----------------------------|----------------------------------|---------|
| **Project IAM Member**      | What a user/service account can do in the project | user:dev@company.com has `roles/viewer` in project |
| **Service Account IAM Member** | Who can **use** or **impersonate** the service account | user:dev@company.com has `roles/iam.serviceAccountUser` on the SA |

---

## 🌍 Cross-Project Service Account Usage

Yes, you can use a **single service account across multiple projects**, as long as:
- The service account is granted roles in the target projects
- The user/tool is allowed to impersonate the SA (if applicable)

### 🪜 Steps:
1. **Create** SA in Project A
2. **Grant roles** in Project B, C, etc.
3. **(Optional)** Allow other users/tools to impersonate the SA

```bash
gcloud projects add-iam-policy-binding project-b   --member="serviceAccount:ci-deploy@project-a.iam.gserviceaccount.com"   --role="roles/compute.admin"
```

```bash
gcloud iam service-accounts add-iam-policy-binding ci-deploy@project-a.iam.gserviceaccount.com   --member="user:jenkins@company.com"   --role="roles/iam.serviceAccountUser"
```

---

## 🔐 Best Practices for Service Accounts

| Best Practice                           | Why? |
|----------------------------------------|------|
| ✅ Use **least privilege**              | Minimize risk if SA is compromised |
| ✅ Use groups or CI tools to impersonate| Easier to manage access            |
| ✅ Use Workload Identity when possible  | Avoids key management              |
| ❌ Avoid assigning `roles/owner`        | Too powerful                       |
| ✅ Monitor SA activity via Audit Logs   | Track usage and potential abuse    |

---

## ✅ Summary

- A service account is a **non-human identity** used by apps and services.
- It can be given roles like a user to access GCP resources.
- Users/tools can **impersonate** service accounts when granted the right IAM role.
- Service accounts can be used **across projects** with proper IAM bindings.
- Always apply **least privilege** and use **impersonation** or **Workload Identity** instead of downloading keys.

---
