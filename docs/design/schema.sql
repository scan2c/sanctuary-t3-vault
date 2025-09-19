## 🧬 Capsule Memory Table

```sql
CREATE TABLE user_memories (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL,
  memory_type VARCHAR(4) NOT NULL CHECK (memory_type IN ('T1','T2','T3')),
  content_ciphertext BLOB NOT NULL, -- AES-256-GCM ciphertext
  content_iv BLOB NOT NULL,         -- Initialization vector
  aead_tag BLOB NOT NULL,           -- Authentication tag
  content_plain_hash CHAR(64),      -- SHA-256 digest
  salience_score FLOAT DEFAULT 1.0, -- Retrieval weight
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  last_accessed TIMESTAMP,
  capsule_id UUID REFERENCES capsules(id) ON DELETE SET NULL
);
