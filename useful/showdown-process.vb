' Replaces all cells in the format #-# (or ##-## and so forth)
' with their integer representation.
' For example, 10-15 will be replaced with 6.
Sub RangeToValue()
    Dim rngCell As Range
    Dim allMatches As Object
    Dim strPattern As String: strPattern = "[0-9]*"
    Dim rangeOverTwentyPattern As String: rangeOverTwentyPattern = "-2[1-9]+"
    Dim regEx As New RegExp
    Dim rangeOverTwenty As New RegExp
    Dim i As Object
    Dim j As Object
    Dim ii As Integer
    Dim jj As Integer
   
    ' Set up regEx objects
    With regEx
        .Global = True
        .MultiLine = False
        .IgnoreCase = False
        .Pattern = strPattern
    End With
    With rangeOverTwenty
        .Global = True
        .MultiLine = False
        .IgnoreCase = False
        .Pattern = rangeOverTwentyPattern
    End With
    
    ' ***BE SURE TO SET THIS***
    Set rngCell = Range("G2:P1454")

    For Each cell In rngCell.Cells
        ' 1) Hyphen only
        If cell.Value = "-" Then
            cell.Value = 0
        ' 2) "1-"
        ElseIf cell.Value = "1-" Then
            cell.Value = 1
        ' 3) Anything else with a hyphen
        ElseIf InStr(cell.Value, "-") Then
            Set allMatches = regEx.Execute(cell.Value)
            If allMatches.Count = 3 Then ' Only one number then hyphen
                cell.Value = 1
            Else ' number before and after hyphen
                Set i = allMatches.Item(0)
                Set j = allMatches.Item(2)
                ii = CInt(i)
                jj = CInt(j)
                ' Splitting into ifs because of the 2002-2005 over 20 vals
                If jj > 20 And ii > 20 Then ' keep the first val only
                    computedValue = ii
                ElseIf jj > 20 Then ' throw away the vals over 20
                    computedValue = 20 - ii + 1
                Else ' do the math...
                    computedValue = jj - ii + 1
                End If
                cell.Value = computedValue
            End If
        ' 4) Has a plus
        ElseIf InStr(cell.Value, "+") Then
            Set allMatches = regEx.Execute(cell.Value)
            ' First get rid of the plus
            cell.Value = allMatches.Item(0)
            ' Then if the value is 20 or less, convert to count
            If cell.Value < 21 Then
                computedValue = 21 - cell.Value
                cell.Value = computedValue
            End If
        End If
    Next cell

End Sub

Sub RemoveEmptyRows()
    'If nothing in first column but something elsewhere in the row, delete the row
    ' While loop only used because it doesn't delete everything in one pass
    ' ***BE SURE TO SET THIS***
    Set colrng = Range("A4:A600")
    Dim i As Integer
    i = 0
    While i < 10
        For Each c In colrng
            If IsEmpty(c) Then c.EntireRow.Delete
        Next
        i = i + 1
    Wend
End Sub
