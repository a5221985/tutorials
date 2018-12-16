# Encryption and Decryption in Java Cryptography #
## Introduction ##
1. [architectural details, using stronger algorithms, and debugging tips](https://www.veracode.com/blog/research/how-get-started-using-java-cryptography-securely)
2. [Cryptographically Secure Pseudo-Random Number Generators](https://www.veracode.com/blog/research/cryptographically-secure-pseudo-random-number-generator-csprng)
3. This article:
	1. How to securely configure encryption/decryption primitives
	2. Series: One stop shop for implementing crypto-system in Java
4. Series:
	1. complimentary to [JCA Reference Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html)
5. Encryption:
	1. Process of using mathematical algorithms to obscure the meaning of a piece of information so that only authorized parties can decipher it.
		1. For data protection
	2. Security of algorithm:
		1. Based on the ability of algorithm to generate ciphertext that is not easily reverted to its original plaintext
	3. key: piece of information that allows only those that hold it to encode and decode message
6. Two general categories of key based algos
	1. **Symmetric encryption algorithms:**
		1. Use same key for encryption and decryption
		2. Can work in block mode (fixed size blocks of data)
		3. Can work in stream mode (bits or bytes of data)
		4. Applications:
			1. Data encryption
			2. File encryption
			3. Tramsitted data in communication networks (TLS, emails, instant messages, ...)	
	2. **Asymmetric (or public key) encryption algorithms:**
		1. Two separate keys for two operations
		2. For computing digital signatures
		3. For key establishment protocols
7. Parameters to configure
	1. Correct algorithm
	2. Right mode of operation
	3. Right padding scheme
	4. Right keys and their sizes
	5. Correct IV initialization with [cryptographically secure CSPRNG](https://www.veracode.com/blog/research/cryptographically-secure-pseudo-random-number-generator-csprng)
8. [Cipher](https://docs.oracle.com/javase/8/docs/api/javax/crypto/Cipher.html)
	1. Object that uses a transformation string

## Choosing the correct algorithm ##
1. Transformation string:
	1. Includes a name of a cryptographic algorithm
		1. 11 algorithms exist
			1. [Standard Algorithm Name Documentation for Java 8](https://docs.oracle.com/javase/8/docs/technotes/guides/security/StandardNames.html#Cipher)
			2. 2 are completely secure
				1. Others are broken or cracks are appearing (DES, RC2, ... RC5) - Sufficient CPU power will do
		2. Always use:
			1. **Symmetric Algorithm: ** AES/AESWrap block cipher
			2. **Asymmetric Algorithm: ** RSA

## Choosing the right mode of operation ##
1. Mode of operation is only relevant to block ciphers
	1. Asymmetric ciphers: ECB is the mode of operation (it is a hack so ignore this value)
		1. [Java Cryptography Architecture (JCA) Reference Guide](https://docs.oracle.com/javase/8/docs/technotes/guides/security/crypto/CryptoSpec.html#Cipher)
	2. Never do the following:

			// ANTI-PATTERN
			// This defaults to using ECB mode of operation, which should never be used for any cryptographic operations. Plaintext blocks generates
			// identical cipher text blocks.
			Cipher c = Cipher.getInstance("AES");

		1. AES algorithm above would be used with ECB mode of operation (makes replay attacks very easy)
		2. Solution:
			1. Use **Authenticated Encryption with Associated Data (AEAD)** mode (For example **GCM** and **CCM**)
			2. Use authentication tag with full 128 bits-length
			3. If using unauthenticated mode, use **CBC** or **CTR** with a **MAC** to authenticate the ciphertext

## Choosing the right padding scheme ##
### Symmetric Algorithms ###
1. Most Block Ciphers: Plaintext needs to be a multiple of block size of underlying encryption algorithm
	1. Needs padding
2. Java provides 3 padding schemes
	1. NoPadding (bad)
	2. ISO1026Padding (must be withdrawn)
	3. **PKCS5Padding**: Good option
		1. May be subject to padding oracle attacks if some modes (CBC mode say) is enabled 
	4. Use AEAD mode of operation to protect against the attacks

### Asymmetric Algorithms ###
1. Two padding schemes:
	1. **OAEPWith<digest>And<mgf>Padding** scheme
	2. For digest: **SHA1** or **SHA256/384/512** (*recommended*)
	3. For Mask Generation Function (MGF): **MGF1** (*recommended*)
2. **PKCS1Padding** with **RSA**: Susceptible to Chosen Ciphertext attacks
3. [Cipher.getInstance](https://docs.oracle.com/javase/8/docs/api/javax/crypto/Cipher.html#getInstance-java.lang.String-)

### Symmetric Encryption ###

		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");

		Cipher c = Cipher.getInstance("AES/CTR/PKCS5Padding");

		Cipher c = Cipher.getInstance("AES/GCM/PKCS5Padding");

		Cipher c = Cipher.getInstance("AES/CCM/PKCS5Padding");

### Asymmetric Encryption ###

		Cipher c = Cipher.getInstance("RSA/ECB/OAEPWithSHA-1AndMGF1Padding");

		Cipher c = Cipher.getInstance("AES/CTR/OAEPWithSHA-1AndMGF1Padding");

		Cipher c = Cipher.getInstance("AES/GCM/OAEPWithSHA-1AndMGF1Padding");

		Cipher c = Cipher.getInstance("AES/CCM/OAEPWithSHA-1AndMGF1Padding");

### Keys ###
1. Security level is proportional to the size of its key
2. Key size:
	1. Must be long enough to overcome brute force attacks
	2. Must be short enough for computational feasibility
		1. Keeping in mind computational advances in next 30 years

### Symmetric Algorithms ###
1. AES: 256 bits
	1. Future proofs the application
		1. Install [Java Cryptography Extension (JCE) Unlimited Strength](http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html) must be installed for this
	2. 128 bits is fine for more known attacks
		1. Rest of the parameters must be carefully configured
2. [KeyGenerator](https://docs.oracle.com/javase/8/docs/api/javax/crypto/KeyGenerator.html)

		KeyGenerator keygen = KeyGenerator.getInstance("AES"); // key generator to be used with AES algorithm.
		keygen.init(256); // Key size is specified here.
		byte[] key = keygen.generateKey().getEncoded();
		SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");

### Asymmetric Algorithms ###
1. At-least 2048 bits (future proofing)
2. 4096 bits if hardware and software support it
3. [KeyPairGenerator](https://docs.oracle.com/javase/8/docs/api/java/security/KeyPairGenerator.html): Is used

		KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
		keyGen.initialize(4096); // key size specifid here.
		KeyPair pair = keyGen.generateKeyPair();

	1. PBKDF2 (Password Based Key Derivation Function) and PBEWith<diget|prf>And<encryption>:

4. PBKDF2: Used when only user supplied passwords are used to protect or allow access to secret information
	1. Derive cryptographic keying material from sources like a passphrase
	2. PBKDFs:
		1. Computed by applying multiple iterations to user-supplied password using pseudorandom function(prf) and salt
		2. Developer must configure:
			1. prf
			2. Iteration count
			3. Salt value
	3. Recommendation:
		1. **SHA2** family of hash functions
		2. Salt value: **64** bits
		3. Iteration count: **10000**
5. PBEWith*: PBKDF2+encryption scheme (CBC mode with PKCS5Padding)
	1. Use any AES cipher algorithm


			// Should be as long and as many special characters as possible
			String user_entered_password = sys.args[0];

			// salt value
			byte[] salt = new byte[128]; // Should be atleast 64 bits
			SecureRandom secRandom = new SecureRandom();
			secRandom.nextBytes(salt); // self-seeded randomizer for salt

			// iteration count
			int iterCount = 12288;

			int derivedKeyLength = 256; // Should be atleast longer than 112 bits. Depends on Key size of algorithm.

			KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, iterCount, derivedKeyLength * 8);
			SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");

	2. To implement PBEWith<digest|prf>And<encryption></encryption></digest|prf>
	
			// Generate PBEKeySpec as above
			String algo = "PBEWithHmacSHA512AndAES_128"; // Using approved Hashing algorithm and recommended block cipher
			 
			SecretKeyFactory skf = SecretKeyFactory.getInstance(algo);
			SecretKey key = skf.generateSecret(ks);

			// Note: there is no typical transformation string. Algorithm, mode (CBC) and padding scheme (PKCS5Padding) is all taken care by
			// PBEWithHmacSHA512AndAES_128.
			Cipher c = Cipher.getInstance(algo);
			c.init(Cipher.ENCRYPT_MODE, key);

### Initialization Vectors ###
1. Initialization vectors are used to add complexity to the cipher
	1. For CTR and CBC modes, IVs must be unpredictable and random
2. [AlgorithmParameterSpecs](https://docs.oracle.com/javase/8/docs/api/java/security/spec/AlgorithmParameterSpec.html)
	1. [IvParameterSpec](https://docs.oracle.com/javase/8/docs/api/javax/crypto/spec/IvParameterSpec.html)
3. Configuration:
	1. Source of randomness
		1. Two places
			1. IvParameterSpec
			2. [init](https://docs.oracle.com/javase/8/docs/api/javax/crypto/Cipher.html#init-int-java.security.Key-java.security.spec.AlgorithmParameterSpec-java.security.SecureRandom-) method of [Cipher](https://docs.oracle.com/javase/8/docs/api/javax/crypto/Cipher.html) class
		2. Randomness comes from `SecureRandom` configuration in init method
		3. IV gets its randomness from `IvParameterSpec`
4. Implementation:

		byte iv[] = new byte[16];

		SecureRandom secRandom = new SecureRandom();
		secRandom.nextBytes(iv); // self-seeded randomizer to generate IV

		IvParameterSpec randomIvSpec = new IvParameterSpec(iv); // IvParameterSpec initialized using its own randomizer.
	
		// randomIvSpec will influence randomness of IV and not "new SecureRandom()"
		c.init(Cipher.ENCRYPT_MODE, skeySpec, randomIvSpec, new SecureRandom());

5. Most modes need a nonce (of key and IV pair)
	1. Only few plaintexts are encrypted with same key/iv pair
6. Full examples:
	1. [Java_Crypto](https://github.com/1MansiS/java_crypto)
