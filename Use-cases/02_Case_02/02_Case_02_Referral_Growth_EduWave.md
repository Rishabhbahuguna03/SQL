# Case 02: Strengthening Referral-led Growth in Tier-2 & Tier-3 Markets

## Context
**EduWave India** is a mid-sized EdTech platform offering online, job-ready courses to students and early professionals.  
To expand beyond major metros, EduWave launched a peer referral program that allows learners and campus ambassadors to invite others to join the platform.

Each learner record tracks:
- who referred them (`referred_by`)
- their signup date, and
- their city of origin.

Recently, EduWave’s marketing analytics team observed that learners referred by a particular **top influencer (ID = 2)** generate high signup numbers but low course completion rates, indicating **shallow, incentive-driven growth**.

Leadership now wants to focus on **high-quality, sustainable learners** those who joined organically or were referred by genuine peers rather than the top influencer.

---

## Problem Statement

Identify learners who were:
1. **Not referred by influencer ID = 2**, or  
2. **Joined organically (no referral)**.

These learners will be the focus group for new retention and engagement programs aimed at improving long-term learner value and reducing dependence on influencer-driven signups.

---

## SQL Query

```sql
SELECT name, city, signup_date
FROM learners
WHERE COALESCE(referred_by, 0) != 2;
```

---

## Business Interpretation

- **Seven learners** were acquired organically or via peer referrals, excluding influencer-driven signups.  
- Concentrated across Tier-2 and Tier-3 cities like **Jaipur, Indore, and Coimbatore**, this group signals **grassroots adoption** driven by course relevance and peer trust.  
- They represent EduWave’s **most sustainable growth segment**, with high potential for engagement and retention.
