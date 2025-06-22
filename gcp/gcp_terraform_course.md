### Full Course Content: GCP + Terraform (Hour-by-Hour Plan for Day 7 to Day 18)

---

#### **Day 7 - Terraform Installation, Providers, Resources (2 hrs)**

**Hour 1: Theoretical + Practice Guide**
- **Theory:**
  - Understand what Infrastructure as Code (IaC) means.
  - Learn the benefits of Terraform.
  - Introduction to Terraform’s architecture (Providers, Resources, State, CLI).
- **Practical:**
  - Download and install Terraform on your local machine.
  - Run: `terraform version` to verify.
  - Initialize an empty directory using `terraform init`.
  - Practice commands: `terraform plan`, `apply`, `destroy`.

**Hour 2: Theoretical + Practice Guide**
- **Theory:**
  - Providers are plugins that allow Terraform to interact with APIs.
  - Learn about Google Cloud Provider.
- **Practical:**
  - Create `main.tf` file with provider block.
  - Generate Service Account key from GCP and authenticate.
  - Create your first Terraform resource: GCP Storage Bucket.

---

#### **Day 8 - Variables, Outputs, Input Validation, tfvars (2 hrs)**

**Hour 3: Theoretical + Practice Guide**
- **Theory:**
  - Variables allow code reuse and flexibility.
  - Types: string, number, bool, list, map.
- **Practical:**
  - Define variables in `variables.tf`.
  - Use `.tfvars` to set values.
  - Add validation to enforce constraints.

**Hour 4: Theoretical + Practice Guide**
- **Theory:**
  - Outputs help share data between modules or display useful info.
- **Practical:**
  - Define `output` block in `outputs.tf`.
  - Output Storage Bucket name, location.
  - Build dynamic Storage Bucket using variable input.

---

#### **Day 9 - VM, VPC, Firewall Creation with Terraform (2 hrs)**

**Hour 5: Theoretical + Practice Guide**
- **Theory:**
  - Basic GCP infrastructure services.
  - Purpose of VPC, Subnet, VM.
- **Practical:**
  - Define resources: `google_compute_network`, `google_compute_subnetwork`, `google_compute_instance`.
  - Setup a basic VM with custom metadata.

**Hour 6: Theoretical + Practice Guide**
- **Theory:**
  - What are firewall rules and why we need them.
- **Practical:**
  - Add `google_compute_firewall` for SSH and HTTP access.
  - Assign an external IP to VM.
  - Output VM IP using outputs.

---

#### **Day 10 - locals, count, for_each, depends_on (2 hrs)**

**Hour 7: Theoretical + Practice Guide**
- **Theory:**
  - Locals help to store expressions used multiple times.
  - Count is used to deploy multiple identical resources.
- **Practical:**
  - Use locals to simplify values (e.g., project_id, region).
  - Create 3 VMs using `count`.

**Hour 8: Theoretical + Practice Guide**
- **Theory:**
  - `for_each` is used for unique resources.
  - `depends_on` ensures resource dependency order.
- **Practical:**
  - Deploy different VMs using map with `for_each`.
  - Add `depends_on` for a firewall depending on VPC.

---

#### **Day 11 - Remote Backend: Store State in GCS (2 hrs)**

**Hour 9: Theoretical + Practice Guide**
- **Theory:**
  - What is Terraform state and its importance.
  - Benefits of remote state.
- **Practical:**
  - Create GCS bucket.
  - Enable versioning.
  - Define `backend` block to store state in GCS.

**Hour 10: Theoretical + Practice Guide**
- **Theory:**
  - Securing Terraform backend with service accounts.
- **Practical:**
  - Use Service Account with required IAM roles.
  - Use `terraform init -migrate-state` to move local to remote.

---

#### **Day 12 - Hands-on Project: GCP Infra with Terraform (2 hrs)**

**Hour 11: Review and Setup**
- **Theory:**
  - Recap: Providers, Resources, Variables, Outputs, State.
- **Practical:**
  - Build a complete mini-infrastructure: VPC, Subnet, VM with External IP.
  - Add firewall rules.

**Hour 12: Finalize and Clean-up**
- **Practical:**
  - Attach IAM roles to service account.
  - Output all important resource details.
  - Run `terraform destroy` and `apply` again.
  - Q&A and error troubleshooting session.

---

#### **Day 13 - Multiple Environments with Workspaces (2 hrs)**

**Hour 13: Theoretical + Practice Guide**
- **Theory:**
  - Concept of multiple environments: dev, stage, prod.
  - Isolating state files for different environments.
- **Practical:**
  - Create Terraform workspaces: `terraform workspace new dev`, etc.
  - Use conditional logic based on workspace.

**Hour 14: Theoretical + Practice Guide**
- **Theory:**
  - What are Terraform modules and their advantages.
- **Practical:**
  - Create reusable modules for VM, VPC, Firewall.
  - Use modules with different variables per environment.

---

#### **Day 14 - GKE with Terraform (2 hrs)**

**Hour 15: Theoretical + Practice Guide**
- **Theory:**
  - Introduction to Google Kubernetes Engine.
  - Benefits of provisioning GKE with Terraform.
- **Practical:**
  - Write Terraform to provision GKE cluster.
  - Setup node pools, workload identity.

**Hour 16: Theoretical + Practice Guide**
- **Theory:**
  - Configure kubectl with generated GKE credentials.
- **Practical:**
  - Access GKE cluster using `gcloud container clusters get-credentials`.
  - Deploy a sample NGINX app on GKE.

---

#### **Day 15 - Private VMs and Cloud NAT (2 hrs)**

**Hour 17: Theoretical + Practice Guide**
- **Theory:**
  - Introduction to Cloud NAT and private IP VMs.
- **Practical:**
  - Provision a VM without public IP.
  - Create Cloud Router and Cloud NAT.
  - Enable internet for private VM.

**Hour 18: Theoretical + Practice Guide**
- **Theory:**
  - Importance of routing in VPC.
- **Practical:**
  - Verify outbound internet connectivity.
  - SSH into private VM via bastion or IAP.

---

#### **Day 16 - Cloud SQL and Secret Manager (2 hrs)**

**Hour 19: Theoretical + Practice Guide**
- **Theory:**
  - Understanding Cloud SQL.
  - Secret Manager use cases and integration.
- **Practical:**
  - Create Cloud SQL instance with Terraform.
  - Store DB credentials in Secret Manager.

**Hour 20: Theoretical + Practice Guide**
- **Theory:**
  - IAM roles required for accessing secrets.
- **Practical:**
  - Inject secrets into Terraform using data block.
  - Connect app with DB credentials from Secret Manager.

---

#### **Day 17 - Full-stack App Deployment on VMs (2 hrs)**

**Hour 21: Theoretical + Practice Guide**
- **Theory:**
  - Architecture of full-stack apps.
  - Importance of startup scripts and provisioning.
- **Practical:**
  - Create VMs for frontend and backend.
  - Use metadata/startup script to install app dependencies.

**Hour 22: Theoretical + Practice Guide**
- **Theory:**
  - Security group setup and exposure.
- **Practical:**
  - Expose app to internet using firewall.
  - Output app URL from Terraform.

---

#### **Day 18 - Wrap-up and Real-Time Use Cases (2 hrs)**

**Hour 23: Theoretical + Practice Guide**
- Recap of all major concepts with short summary.
- Real-time architecture: Dev, Stage, Prod setup.
- Team collaboration with Terraform (state locking, modules).

**Hour 24: Final Practice + Interview Prep**
- Hands-on mini-project with all concepts combined.
- Prepare Terraform interview questions.
- Final Q&A and feedback session.

