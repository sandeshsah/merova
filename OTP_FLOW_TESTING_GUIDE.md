# OTP Flow Testing Guide

## Registration to OTP Flow - Fixed ✅

### Issue Identified
The OTP page was not properly using the callback provided by the register page, and the error message didn't indicate the correct OTP to use.

### Changes Made

1. **OTP Page (`otp_page.dart`)**
   - ✅ Fixed `_verifyOtp()` method to use the `onPressed` callback if provided
   - ✅ Falls back to default navigation if no callback is provided
   - ✅ Updated error message to show "Invalid OTP. Try 1111" for better UX
   - ✅ Display actual phone number/email instead of flow name

2. **Balance Card Widget (`balance_card.dart`)**
   - ✅ Removed unused import to fix lint error

---

## How to Test the Registration → OTP Flow

### Step 1: Register a New Account
1. Open the app and navigate to the Register page
2. Fill in the following details:
   - **Full Name**: John Doe
   - **Email**: john@example.com
   - **Phone**: 9876543210 (with country code +977)
   - **Password**: Test@123
3. Check the "I agree to Terms" checkbox
4. Click the **Register** button

### Step 2: OTP Verification
1. You should be navigated to the **OTP Verification** page
2. The page should display: "We have sent an OTP code to **9876543210**"
3. Enter the OTP: **1111** (this is the test OTP)
4. The OTP will auto-verify when all 4 digits are entered
5. Alternatively, you can click the **Verify** button

### Step 3: Welcome Screen
1. After successful OTP verification, you'll see the **Welcome Screen**
2. The screen displays:
   - Green checkmark icon
   - "Welcome onboard!" message
   - Your UID (phone number with country code)
   - Features list
3. Click **"Back to login →"** button

### Step 4: Login
1. You'll be navigated back to the **Login Page**
2. Your credentials are already saved (Remember Me is enabled by default)
3. You can now login with your UID and password

---

## Complete Flow Diagram

```
┌─────────────────┐
│  Register Page  │
│                 │
│  Fill Details   │
│  Click Register │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   OTP Page      │
│                 │
│  Enter: 1111    │
│  Auto-verify    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Welcome Screen  │
│                 │
│  Show UID       │
│  Click "Back"   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Login Page    │
│                 │
│  Ready to Login │
└─────────────────┘
```

---

## Test OTP Codes

| Flow Type        | Test OTP | Expected Result                    |
|------------------|----------|------------------------------------|
| Register         | 1111     | Navigate to Welcome Screen         |
| Forgot Password  | 1111     | Navigate to Reset Password Page    |
| Any other        | ----     | Show "Invalid OTP. Try 1111"       |

---

## Additional Features Tested

### OTP Page Features:
- ✅ Auto-focus on first input box
- ✅ Auto-advance to next box when digit is entered
- ✅ Auto-verify when all 4 digits are entered
- ✅ Manual verify button
- ✅ Resend OTP timer (30 seconds)
- ✅ "Send again" button appears after timer expires
- ✅ Display actual phone/email instead of flow type

### Register Page Features:
- ✅ Form validation
- ✅ Country code picker
- ✅ Password visibility toggle
- ✅ Terms and conditions checkbox
- ✅ Loading state during registration
- ✅ Success message with SnackBar
- ✅ Auto-enable "Remember Me" on registration

---

## Troubleshooting

### Issue: OTP page doesn't appear after registration
**Solution**: Make sure you've filled all required fields and checked the Terms checkbox

### Issue: OTP verification fails
**Solution**: Make sure you're entering exactly **1111** as the OTP

### Issue: Welcome screen doesn't show UID
**Solution**: The UID should be your phone number with country code (e.g., +9779876543210)

### Issue: Can't navigate back to login
**Solution**: Use the "Back to login →" button on the Welcome Screen, not the back button

---

## Code Changes Summary

### File: `otp_page.dart`

**Before:**
```dart
if (enteredOtp == "1111") {
  if (widget.flow == "register") {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => WelcomeScreen(uid: widget.emailOrPhone ?? "UNKNOWN"),
      ),
      (_) => false,
    );
  }
}
```

**After:**
```dart
if (enteredOtp == "1111") {
  if (widget.flow == "register") {
    // Use the callback if provided, otherwise navigate to WelcomeScreen
    if (widget.onPressed != null) {
      widget.onPressed!();
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => WelcomeScreen(uid: widget.emailOrPhone ?? "UNKNOWN"),
        ),
        (_) => false,
      );
    }
  }
}
```

---

## Next Steps

1. ✅ Test the complete registration flow
2. ✅ Verify OTP page displays correctly
3. ✅ Confirm navigation to Welcome Screen
4. ✅ Test login with registered credentials
5. 🔄 Connect to actual OTP API (when backend is ready)
6. 🔄 Implement actual OTP generation and validation
7. 🔄 Add OTP expiration logic

---

## Notes

- The current implementation uses a hardcoded OTP "1111" for testing
- In production, you'll need to integrate with your backend OTP service
- The register page automatically enables "Remember Me" for better UX
- User credentials are stored in SharedPreferences for quick login
