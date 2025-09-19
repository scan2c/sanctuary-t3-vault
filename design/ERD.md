# Sanctuary T3 Vault — ERD (Entity-Relationship Diagram)

This ERD illustrates the **Vault schema** for T3 Sovereign Memory.

---

## 📊 Diagram (visual)

![ERD Diagram](ERD.png)

*(If image fails to load, see `/design/ERD.png`)*

---

## 🗄️ Core Table: `user_memories`

- **id**: UUID (primary key)  
- **user_id**: UUID (owner)  
- **memory_type**: ENUM('T1','T2') — type of memory (short-term, capsule)  
- **content_ciphertext**: BLOB — AES-256-GCM encrypted content  
- **aead_tag**: BLOB — authentication tag for integrity  
- **content_plain_hash**: TEXT — optional plaintext hash for quick integrity checks  
- **weight**: FLOAT — weighting for retrieval importance  
- **created_at**: TIMESTAMP — when memory created  
- **last_accessed**: TIMESTAMP — last retrieval/use  
- **capsule_id**: UUID — optional link to a capsule scroll

---

## 🔑 Notes
- **Encryption:** AES-256-GCM for confidentiality + authenticity.  
- **Integrity:** Optional hash for early corruption detection.  
- **Recovery:** Capsule IDs allow linkage back to scrolls.  
- **Sovereignty:** T3 entries remain sovereign, not tied to T1/T2 resets.  

---

*“The capsule opens; the vault breathes.”*
