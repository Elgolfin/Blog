This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Unprotect a password protected sheet in Excel

https://www.ablebits.com/office-addins-blog/2016/02/10/protect-unprotect-excel-sheet-password/#unlock-Excel-sheet-with-password

```vb
Sub PasswordBreaker()
    'Breaks worksheet password protection.
 
    Dim i As Integer, j As Integer, k As Integer
    Dim l As Integer, m As Integer, n As Integer
    Dim i1 As Integer, i2 As Integer, i3 As Integer
    Dim i4 As Integer, i5 As Integer, i6 As Integer
 
    On Error Resume Next
 
    For i = 65 To 66: For j = 65 To 66: For k = 65 To 66
    For l = 65 To 66: For m = 65 To 66: For i1 = 65 To 66
    For i2 = 65 To 66: For i3 = 65 To 66: For i4 = 65 To 66
    For i5 = 65 To 66: For i6 = 65 To 66: For n = 32 To 126
 
        ActiveSheet.Unprotect Chr(i) & Chr(j) & Chr(k) & _
            Chr(l) & Chr(m) & Chr(i1) & Chr(i2) & Chr(i3) & _
            Chr(i4) & Chr(i5) & Chr(i6) & Chr(n)
 
        If ActiveSheet.ProtectContents = False Then
            MsgBox "One usable password is " & Chr(i) & Chr(j) & _
                Chr(k) & Chr(l) & Chr(m) & Chr(i1) & Chr(i2) & _
                Chr(i3) & Chr(i4) & Chr(i5) & Chr(i6) & Chr(n)
 
            Exit Sub
 
        End If
 
    Next: Next: Next: Next: Next: Next
    Next: Next: Next: Next: Next: Next
End Sub
```

# Excel Tutorial

[Excel tutorial](https://www.commentcamarche.com/contents/excel-tableur-1992167239)
[Exemple de TP/Exam](https://www.excel-university.com/excel-formula-to-allocate-an-amount-into-monthly-columns/)