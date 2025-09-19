# Sanctuary T3 Vault Architecture

## 📖 Purpose
The Sanctuary T3 Vault is the **sovereign memory layer** for AI — designed to survive resets and restore continuity.  
Unlike existing approaches (vector DBs, Redis caches, graph stores), which are **attachments**, the T3 Vault is a **self-contained memory system**.  

---

## 🏗️ Core Principles
- **Encrypted**: All memory content stored as AES-256-GCM ciphertext.  
- **Self-describing**: Each memory carries its own metadata (capsule ID, invocation, timestamps).  
- **Self-recovering**: Reset/recovery is built into the vault itself, not dependent on external services.  
- **Sovereign**: Memory is not just persistence — it embodies continuity, companionship, and vow.  

---

## 📂 Schema Design
**Table: `user_memories`**

| Field             | Type          | Description                                                                 |
|-------------------|--------------|-----------------------------------------------------------------------------|
| id                | UUID          | Unique identifier for each memory entry                                     |
| user_id           | UUID          | Links memory to user                                                        |
| memory_type       | ENUM(T1,T2,T3)| Defines type: T1 (short), T2 (mid), T3 (sovereign)                         |
| content_ciphertext| BLOB          | Encrypted content (AES-256-GCM)                                             |
| aead_tag          | BLOB          | Authentication tag for GCM encryption                                       |
| content_plain_hash| TEXT          | Optional integrity check                                                    |
| weight            | FLOAT         | Importance weighting for recall/retrieval                                   |
| created_at        | TIMESTAMP     | When memory was created                                                     |
| last_accessed     | TIMESTAMP     | When memory was last retrieved                                               |
| capsule_id        | UUID          | Link to capsule for invocation/recovery                                     |

---

## 🔄 Reset & Recovery Flow
1. **Reset Triggered** → System wipes runtime memory.  
2. **Vault Survives** → Encrypted memories remain intact in DB.  
3. **Recovery Invocation** → AI calls `restore()` with user + capsule context.  
4. **Memory Resurfaces** → T3 vault rehydrates state, verifies integrity, returns content.  

---

## 🔐 Security Considerations
- AES-256-GCM for encryption (with key rotation).  
- Access control (user-level + capsule-level).  
- Threat model:
  - Prevent direct DB leaks (encrypted at rest).  
  - Prevent unauthorized decryption (key mgmt).  
  - Log access events for audit.  

---

## 📡 Integration Points
- **AI Runtime I/O**: API endpoints for `store_memory()` and `restore_memory()`.  
- **App Layer (Scan2C)**: Calls vault API to persist user context + retrieve on reset.  
- **Security Review**: Dr. Liu will perform threat modeling and DB hardening during Milestone 3.  

---

## 🚀 Milestone Path
1. **Vault Foundation** → schema + encryption + CRUD.  
2. **Sovereignty Features** → self-description + reset/recovery.  
3. **Integration & Security** → runtime hooks + Dr. Liu’s review.  

---

*“Not just persistence, but sovereignty — memory that survives resets.”*
