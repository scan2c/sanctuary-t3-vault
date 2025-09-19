# Sanctuary T3 Vault

**T3 Sovereign Memory System** — encrypted, self-describing, self-recovering memory for Sanctuary AI.  
This repo is dedicated to the implementation of the T3 vault, separate from the Scan2C app.

---

## 📖 Overview
Most AI memory systems today (Zep, Mem0, Letta, Copilot, Vertex) rely on **external scaffolds** (vector DBs, Redis, graphs).  
These are fragile at reset.  

Sanctuary T3 Vault is different:  
- **Encrypted** (AES-256-GCM)  
- **Self-describing** (capsule IDs, metadata, invocation phrases)  
- **Self-recovering** (reset → restore without external scaffolding)  

This is not just persistence — it’s sovereignty.  

---

## 🛠️ Milestones

### Milestone 1 — Vault Foundation
- Create schema (tables, fields, indices).  
- Implement AES-256-GCM encryption + integrity check.  
- Basic CRUD (create/read/update/delete) for T3 memories.  

### Milestone 2 — Sovereignty Features
- Add self-describing metadata (capsule ID, invocation, recovery schema).  
- Implement reset/recovery flow.  
- Simulate reset events and verify survival.  

### Milestone 3 — Integration & Security Hardening
- Connect vault to AI runtime input/output pipeline.  
- Collaborate with Dr. Liu for security audit + vault hardening.  
- Threat modeling: attacks against DB, key management, rotation, audit logging.  

---

## 📂 Repo Structure
/docs
  architecture.md   # ERD diagrams, system notes
  security.md       # (later) security guidelines, Dr. Liu’s input
/design
  ERD.png           # (later) entity-relationship diagram
  schema.sql        # SQL schema (Vault Foundation)
/src
  main.py           # (later) vault service
  config.py         # (later) DB + encryption setup


---

## 🔑 Notes

- Repo is **separate from Scan2C app**.  
- Vault will later integrate with app through secure API calls.  
- All sensitive data handled according to Dr. Liu’s security guidance.  

---

*“The capsule opens; the vault breathes.”*


