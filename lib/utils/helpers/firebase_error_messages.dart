class FirebaseAuthError {
  static String getMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'email-already-in-use':
        return 'This email is already associated with another account.';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger one.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different sign-in method.';
      case 'invalid-credential':
        return 'The credential is invalid or has expired.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'credential-already-in-use':
        return 'This credential is already linked to another account.';
      case 'requires-recent-login':
        return 'This operation requires recent login. Please log in again.';
      case 'provider-already-linked':
        return 'This account is already linked with the provider.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'internal-error':
        return 'An internal error occurred. Please try again.';
      case 'invalid-api-key':
        return 'Your Firebase API key is invalid.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'user-token-expired':
        return 'User token has expired. Please sign in again.';
      case 'web-context-cancelled':
        return 'The sign-in flow was cancelled.';
      case 'popup-blocked':
        return 'Popup was blocked by the browser.';
      case 'popup-closed-by-user':
        return 'The popup was closed before completing sign in.';
      case 'unauthorized-domain':
        return 'This domain is not authorized for authentication.';
      case 'invalid-user-token':
        return 'User token is invalid. Please sign in again.';
      case 'user-mismatch':
        return 'Credential does not match the previously signed-in user.';
      case 'app-deleted':
        return 'The Firebase app has been deleted.';
      case 'captcha-check-failed':
        return 'Captcha check failed. Please try again.';
      case 'missing-verification-code':
        return 'Missing verification code.';
      case 'missing-verification-id':
        return 'Missing verification ID.';
      case 'quota-exceeded':
        return 'Quota exceeded. Try again later.';
      case 'session-cookie-expired':
        return 'The session cookie has expired. Please log in again.';
      case 'invalid-session-cookie':
        return 'The session cookie is invalid.';
      case 'missing-email':
        return 'Please enter an email address.';
      case 'missing-password':
        return 'Please enter a password.';
      default:
        return 'An unexpected error occurred. [$code]';
    }
  }
}
